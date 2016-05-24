.class final Lcom/localytics/android/JavaScriptClient;
.super Ljava/lang/Object;
.source "JavaScriptClient.java"


# instance fields
.field private mCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "callbacks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/localytics/android/JavaScriptClient;->mCallbacks:Ljava/util/Map;

    .line 26
    return-void
.end method

.method private invoke(I[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "methodId"    # I
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 130
    const/4 v1, 0x0

    .line 132
    .local v1, "result":Ljava/lang/Object;
    iget-object v2, p0, Lcom/localytics/android/JavaScriptClient;->mCallbacks:Ljava/util/Map;

    if-eqz v2, :cond_17

    .line 134
    iget-object v2, p0, Lcom/localytics/android/JavaScriptClient;->mCallbacks:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/AmpCallable;

    .line 135
    .local v0, "callable":Lcom/localytics/android/AmpCallable;
    if-eqz v0, :cond_17

    .line 137
    invoke-virtual {v0, p2}, Lcom/localytics/android/AmpCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 141
    .end local v0    # "callable":Lcom/localytics/android/AmpCallable;
    .end local v1    # "result":Ljava/lang/Object;
    :cond_17
    return-object v1
.end method


# virtual methods
.method public getAttributes()Ljava/lang/String;
    .registers 4

    .prologue
    .line 124
    const/4 v1, 0x7

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/localytics/android/JavaScriptClient;->invoke(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 125
    .local v0, "customDimensions":Ljava/lang/String;
    return-object v0
.end method

.method public getCallbacks()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    iget-object v0, p0, Lcom/localytics/android/JavaScriptClient;->mCallbacks:Ljava/util/Map;

    return-object v0
.end method

.method public getCustomDimensions()Ljava/lang/String;
    .registers 4

    .prologue
    .line 118
    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/localytics/android/JavaScriptClient;->invoke(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 119
    .local v0, "customDimensions":Ljava/lang/String;
    return-object v0
.end method

.method public getIdentifiers()Ljava/lang/String;
    .registers 4

    .prologue
    .line 112
    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/localytics/android/JavaScriptClient;->invoke(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 113
    .local v0, "identifiers":Ljava/lang/String;
    return-object v0
.end method

.method public getJsGlueCode()Ljava/lang/String;
    .registers 5

    .prologue
    .line 35
    const-string v0, "javascript:(function() {  var localyticsScript = document.createElement(\'script\');  localyticsScript.type = \'text/javascript\';  localyticsScript.text = \' \t localytics.identifers = %s;\t localytics.customDimensions = %s;\t localytics.attributes = %s;    localytics.tagEvent = function(event, attributes, customDimensions, customerValueIncrease) {\t   localytics.nativeTagEvent(event, JSON.stringify(attributes), JSON.stringify(customDimensions), customerValueIncrease);    };    localytics.setCustomDimension = function(number, value) {      if (number != null && value != null)        localytics.nativeSetCustomDimension(number, value);    };    window.open = function(url) {      if (url != null)        localytics.navigate(url);    };    localytics.close = function() {      localytics.nativeClose();    };\';  document.getElementsByTagName(\'body\')[0].appendChild(localyticsScript);})()"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/localytics/android/JavaScriptClient;->getIdentifiers()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/localytics/android/JavaScriptClient;->getCustomDimensions()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-virtual {p0}, Lcom/localytics/android/JavaScriptClient;->getAttributes()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
