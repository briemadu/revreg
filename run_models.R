# Main analysis script to fit GLMMs 
# Creates a directory with the same name of dataset file
# Saves model predictions, diagnostics, & full GLMM coefficients

path_dir <- "path-to-data"
conds <-  c("effective_revisions-regressions", "revisions-regressions")

# create data frames for results 
full_mod_sum_df <- c()
all_lrt_df <- c()

for (cond in conds) {
  filenames <- list.files(paste0(path_dir, cond), pattern = "csv")
  for (file in filenames){
    c_name <- ifelse(cond=="revisions-regressions", "rev", "e-rev")
    mod_name <- paste0(c_name,"-", substr(file, 1, nchar(file)-4))
    results <- data.frame(model = mod_name)
    
    # create directory & load data file
    dir <- paste0(path_dir, cond, "/", substr(file, 1, nchar(file)-4))
    if (dir.exists(dir)) {next}
    dir.create(dir)
    dat <- read.delim2(paste0(path_dir, cond, "/",file), sep=",")
    
    # calculate skipped & regressed probabilites, add to data table
    dat <- dat %>% filter(regression %in% c("1.0", "0.0", "-1.0")) # exclude missing data points
    dat$regression <- as.numeric(dat$regression)
    dat$token_position <- dat$token_position +1
    dat <- dat %>% mutate(skipped_bin = case_when(
      regression == 1 ~ 0,
      regression == 0 ~ 0,
      regression == -1 ~ 1),
      reg_bin = case_when(
        regression == 1 ~ 1,
        regression == 0 ~ 0,
        regression == -1 ~ 0 
      ))
    dat <- dat %>% group_by(Token) %>% mutate(reg_prob = mean(reg_bin),
                                              skip_prob = mean(skipped_bin))
    
    # fit models
    null <- glmer(revision ~ log(token_position) + (1|textid),
                         family=binomial(link="logit"),
                         data=dat)
    full<- glmer(revision ~ skip_prob + reg_prob + log(token_position) + 
                    (1|textid), 
                  family=binomial(link="logit"),
                  data=dat)
    lrt <- anova(null, full, test="lrt")
    
    ##############
    # save results
    ##############
    
    # prediction plots
    reg_pred <- plot_model(full, type="pred")$reg_prob+
      labs(title=mod_name) + theme_bw() + theme(plot.title=element_text(size=10))
      
    skip_pred <- plot_model(full, type="pred")$skip_prob+
      labs(title=mod_name) + theme_bw() + theme(plot.title=element_text(size=10))
    
    tok_pred <- plot_model(full, type="pred")$token+
      labs(title=mod_name) + theme_bw() + theme(plot.title=element_text(size=10))
    
    ggsave(reg_pred, file = paste0(dir,"/reg_pred.png"), dpi=300)
    ggsave(skip_pred, file = paste0(dir,"/skip_pred.png"), dpi=300)
    ggsave(tok_pred, file = paste0(dir,"/token_pred.png"), dpi=300)
    
    # coefficient plot
    coef_plot <- plot_model(full, show.values = T, show.p = T) + theme_bw()
    ggsave(coef_plot, file =paste0(dir,"/coef_plot.png")) + theme_bw()
    
    # RE plots
    diag_plot <- plot_model(full, type="diag")$textid 
    re_plot <- plot_model(full, type="re")
    ggsave(diag_plot, file=paste0(dir,"/diag_plot.png"))
    ggsave(re_plot, file=paste0(dir,"/re_plot.png"))
    
    # save model summaries & coefficients
    full_mod_sum <- as.data.frame(summary(full)$coef) %>% mutate(model_name = mod_name)
    full_mod_sum_df <- rbind(full_mod_sum_df, full_mod_sum)
    lrt_df <- as.data.frame(lrt) %>% mutate(model_name = mod_name)
    all_lrt_df <- rbind(all_lrt_df, lrt_df)
    
    # save model
    #save(full, file = paste0(dir,"/full_model.Rda"))
  }
}

write_csv(full_mod_sum_df, file="./results/glmm_results.csv")
write_csv(all_lrt_df , file="./results/lrt_results.csv")