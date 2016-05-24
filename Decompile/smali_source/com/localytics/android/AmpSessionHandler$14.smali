.class Lcom/localytics/android/AmpSessionHandler$14;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;

.field final synthetic val$attributes:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;)V
    .registers 3

    .prologue
    .line 931
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$14;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iput-object p2, p0, Lcom/localytics/android/AmpSessionHandler$14;->val$attributes:Ljava/util/Map;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v8, 0x0

    .line 935
    iget-object v7, p0, Lcom/localytics/android/AmpSessionHandler$14;->val$attributes:Ljava/util/Map;

    if-nez v7, :cond_7

    move-object v7, v8

    .line 970
    :goto_6
    return-object v7

    .line 940
    :cond_7
    iget-object v7, p0, Lcom/localytics/android/AmpSessionHandler$14;->val$attributes:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    if-nez v7, :cond_11

    move-object v7, v8

    .line 942
    goto :goto_6

    .line 948
    :cond_11
    :try_start_11
    const-string v7, "%s:%s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/localytics/android/AmpSessionHandler$14;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v11, v11, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string v11, ""

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 949
    .local v0, "applicationAttributePrefix":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 950
    .local v4, "jsonAttributes":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/localytics/android/AmpSessionHandler$14;->val$attributes:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_39
    :goto_39
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_77

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 955
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 957
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 958
    .local v5, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 959
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_68
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_68} :catch_69

    goto :goto_39

    .line 964
    .end local v0    # "applicationAttributePrefix":Ljava/lang/String;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "jsonAttributes":Lorg/json/JSONObject;
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :catch_69
    move-exception v1

    .line 966
    .local v1, "e":Lorg/json/JSONException;
    sget-boolean v7, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v7, :cond_75

    .line 968
    const-string v7, "Localytics"

    const-string v9, "[JavaScriptClient]: Failed to get attributes"

    invoke-static {v7, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_75
    move-object v7, v8

    .line 970
    goto :goto_6

    .line 962
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "applicationAttributePrefix":Ljava/lang/String;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "jsonAttributes":Lorg/json/JSONObject;
    :cond_77
    :try_start_77
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_7a
    .catch Lorg/json/JSONException; {:try_start_77 .. :try_end_7a} :catch_69

    move-result-object v7

    goto :goto_6
.end method
