# Eye-tracking Reading Time Corpora

Here are the links and, when possible, commands to download the 6 datasets used
in the paper.

## RastrOS (Brazilian Portuguese)

Leal, Sidney Evaldo, et al. "RastrOS Project: Natural Language Processing 
contributions to the development of an eye-tracking corpus with predictability 
norms for Brazilian Portuguese." Language Resources and Evaluation (2022): 1-40.

- [Link to publication](https://link.springer.com/article/10.1007/s10579-022-09609-0)
- [Link to data](https://osf.io/9jxg3/)

```bash
osf -p 9jxg3 clone RastrOS/
```

## PoTeC - Potsdam Textbook Corpus (German)

Makowski, Silvia, et al. "A discriminative model for identifying readers and 
assessing text comprehension from eye movements." Machine Learning and 
Knowledge Discovery in Databases: European Conference, ECML PKDD 2018, Dublin, 
Ireland, September 10–14, 2018, Proceedings, Part I 18. Springer International 
Publishing, 2019.

Jäger, Lena A., et al. "Deep eyedentification: Biometric identification using 
micro-movements of the eye." Machine Learning and Knowledge Discovery in 
Databases: European Conference, ECML PKDD 2019, Würzburg, Germany, September 
16–20, 2019, Proceedings, Part II. Springer International Publishing, 2020.

- [Link to publication](http://www.ecmlpkdd2018.org/wp-content/uploads/2018/09/21.pdf)
- [Other pulblication](https://arxiv.org/abs/1906.11889)
- [Link to data](https://osf.io/dn5hp/)


```bash
osf -p dn5hp clone PoTeC/
unzip -d PoTeC/osfstorage/eyetracking_data/ PoTeC/osfstorage/eyetracking_data.zip 
rm PoTeC/osfstorage/eyetracking_data.zip 
```

## Provo Corpus (English)

Luke, Steven G., and Kiel Christianson. "The Provo Corpus: A large eye-tracking 
corpus with predictability norms." Behavior research methods 50 (2018): 826-833.

- [Link to publication](https://link.springer.com/article/10.3758/s13428-017-0908-4)
- [Link to data](https://osf.io/sjefs/)

```bash
osf -p sjefs clone Provo/
unzip Provo/osfstorage/Provo\ Corpus\ Eyelink\ Program\ Files\ and\ Raw\ Data.zip -d Provo/osfstorage/Provo\ Corpus\ Eyelink\ Program\ Files\ and\ Raw\ Data/
rm Provo/osfstorage/Provo\ Corpus\ Eyelink\ Program\ Files\ and\ Raw\ Data.zip
```

## MECO-L1 (Multilingual)

Siegelman, Noam, et al. "Expanding horizons of cross-linguistic research on 
reading: The Multilingual Eye-movement Corpus (MECO)." Behavior research 
methods (2022): 1-21.

- [Link to publication](https://link.springer.com/article/10.3758/s13428-021-01772-6)
- [Link to data](https://osf.io/3527a/)

```bash
osf -p 3527a clone MECO-L1/
```

## MECO-L2 (English, L2 readers)

Kuperman, Victor, et al. "Text reading in English as a second language: 
Evidence from the Multilingual Eye-Movements Corpus." Studies in Second 
Language Acquisition (2022): 1-35.

- [Link to publication](https://www.cambridge.org/core/journals/studies-in-second-language-acquisition/article/text-reading-in-english-as-a-second-language-evidence-from-the-multilingual-eyemovements-corpus/31CE1F8A8D33F93EE31B75AF26F76DB5)
- [Link to data](https://osf.io/q9h43/)

```bash
osf -p q9h43 clone MECO-L2/
```

# Nicenboim Corpus (Spanish)

- [Link to publication](https://doi.org/10.3389/fpsyg.2015.00312)
- [Link to data](https://github.com/bnicenboim/papers/tree/master/NicenboimEtAl2015.%20Working%20memory%20differences%20in%20long-distance%20dependency%20resolution)

```bash
mkdir Nicenboim
wget https://github.com/bnicenboim/papers/raw/master/NicenboimEtAl2015.%20Working%20memory%20differences%20in%20long-distance%20dependency%20resolution/data/NicenboimEtAl2013ET.Rda -P Nicenboim
```
