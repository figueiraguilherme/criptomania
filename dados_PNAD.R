library(PNADcIBGE)
library(survey)

arr_20_29 = c()
arr_30_39 = c()
arr_40_49 = c()
arr_50_59 = c()
arr_60_inf = c()

dadosPNADc = get_pnadc(year = 2022, quarter = 3, vars = c("VD4001","VD4002","V2007","V2009") ,design = TRUE)

POP_20_29 = ftable(svytotal(x=~interaction(V2007),design=subset(dadosPNADc,(V2009>=20 & V2009<=29)),na.rm=TRUE))
POP_30_39 = ftable(svytotal(x=~interaction(V2007),design=subset(dadosPNADc,(V2009>=30 & V2009<=39)),na.rm=TRUE))
POP_40_49 = ftable(svytotal(x=~interaction(V2007),design=subset(dadosPNADc,(V2009>=40 & V2009<=49)),na.rm=TRUE))
POP_50_59 = ftable(svytotal(x=~interaction(V2007),design=subset(dadosPNADc,(V2009>=50 & V2009<=59)),na.rm=TRUE))
POP_60_inf = ftable(svytotal(x=~interaction(V2007),design=subset(dadosPNADc,(V2009>=60)),na.rm=TRUE))

arr_20_29 = append(arr_20_29,POP_20_29[,1])
arr_30_39 = append(arr_30_39,POP_30_39[,1])
arr_40_49 = append(arr_40_49,POP_40_49[,1])
arr_50_59 = append(arr_50_59,POP_50_59[,1])
arr_60_inf = append(arr_60_inf,POP_60_inf[,1])

FT_20_29 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=20 & V2009<=29)),na.rm=TRUE))
FT_30_39 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=30 & V2009<=39)),na.rm=TRUE))
FT_40_49 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=40 & V2009<=49)),na.rm=TRUE))
FT_50_59 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=50 & V2009<=59)),na.rm=TRUE))
FT_60_inf = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=60)),na.rm=TRUE))

arr_20_29 = append(arr_20_29,FT_20_29[,1])
arr_30_39 = append(arr_30_39,FT_30_39[,1])
arr_40_49 = append(arr_40_49,FT_40_49[,1])
arr_50_59 = append(arr_50_59,FT_50_59[,1])
arr_60_inf = append(arr_60_inf,FT_60_inf[,1])

PO_20_29 = ftable(svytotal(x=~interaction(V2007,VD4002),design=subset(dadosPNADc,(V2009>=20 & V2009<=29)),na.rm=TRUE))
PO_30_39 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=30 & V2009<=39)),na.rm=TRUE))
PO_40_49 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=40 & V2009<=49)),na.rm=TRUE))
PO_50_59 = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=50 & V2009<=59)),na.rm=TRUE))
PO_60_inf = ftable(svytotal(x=~interaction(V2007,VD4001),design=subset(dadosPNADc,(V2009>=60)),na.rm=TRUE))

arr_20_29 = append(arr_20_29,PO_20_29[,1])
arr_30_39 = append(arr_30_39,PO_30_39[,1])
arr_40_49 = append(arr_40_49,PO_40_49[,1])
arr_50_59 = append(arr_50_59,PO_50_59[,1])
arr_60_inf = append(arr_60_inf,PO_60_inf[,1])

df = data.frame(faixa_20_29 = c(arr_20_29),faixa_30_39 = c(arr_30_39),
           faixa_40_49 = c(arr_40_49),faixa_50_59 = c(arr_50_59),
           faixa_60_inf = c(arr_60_inf))
df['descricao'] = rownames(df)

library(writexl)
write_xlsx(df,"/dados_3t_22.xlsx")
