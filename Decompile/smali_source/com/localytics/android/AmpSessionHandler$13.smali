.class Lcom/localytics/android/AmpSessionHandler$13;
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


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 905
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$13;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 909
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 910
    .local v2, "jsonCustomDimensions":Lorg/json/JSONObject;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    const/16 v3, 0xa

    if-ge v1, v3, :cond_36

    .line 914
    :try_start_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "c"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/localytics/android/AmpSessionHandler$13;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-virtual {v4, v1}, Lcom/localytics/android/AmpSessionHandler;->getCustomDimension(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_26} :catch_29

    .line 910
    :cond_26
    :goto_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 916
    :catch_29
    move-exception v0

    .line 918
    .local v0, "e":Lorg/json/JSONException;
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_26

    .line 920
    const-string v3, "Localytics"

    const-string v4, "[JavaScriptClient]: Failed to get custom dimension"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26

    .line 925
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_36
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
