.class public Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKGetCitiesAsyncTaskParams.java"


# instance fields
.field private citySearchStr:Ljava/lang/String;

.field private countryId:Ljava/lang/String;

.field private stateId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 38
    instance-of v2, p1, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    if-eqz v2, :cond_14

    move-object v0, p1

    .line 39
    check-cast v0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    .line 40
    .local v0, "otherObject":Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_15

    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_15

    .line 60
    .end local v0    # "otherObject":Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    :cond_14
    :goto_14
    return v1

    .line 42
    .restart local v0    # "otherObject":Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    :cond_15
    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_29

    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 46
    :cond_29
    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_35

    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_14

    .line 48
    :cond_35
    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_49

    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 52
    :cond_49
    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_55

    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_14

    .line 54
    :cond_55
    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_69

    invoke-virtual {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 58
    :cond_69
    const/4 v1, 0x1

    goto :goto_14
.end method

.method public getCitySearchStr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->citySearchStr:Ljava/lang/String;

    return-object v0
.end method

.method public getCountryId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 13
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->countryId:Ljava/lang/String;

    return-object v0
.end method

.method public getStateId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->stateId:Ljava/lang/String;

    return-object v0
.end method

.method public setCitySearchStr(Ljava/lang/String;)V
    .registers 2
    .param p1, "citySearchStr"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->citySearchStr:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setCountryId(Ljava/lang/String;)V
    .registers 2
    .param p1, "countryId"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->countryId:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public setStateId(Ljava/lang/String;)V
    .registers 2
    .param p1, "stateId"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->stateId:Ljava/lang/String;

    .line 26
    return-void
.end method
