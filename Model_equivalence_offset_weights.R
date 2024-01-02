expo_data<-read.csv("expo_data.csv")
options(scipen=999)

formula<-"N~Area+VehPower+VehAge+DrivAge+BonusMalus+VehBrand+VehGas+Density+Region"

model<-glm(formula,family=poisson(link="log"),offset=log(Exposure),data=expo_data)
summary(model)


formula2<-"N/Exposure~Area+VehPower+VehAge+DrivAge+BonusMalus+VehBrand+VehGas+Density+Region"
model2<-glm(formula2,family=poisson(link="log"),weights=Exposure,data=expo_data)
summary(model2)
model2$deviance
model2$null.deviance
