.class public final Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
.super Ljava/lang/Object;
.source "Receipt.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    }
.end annotation


# instance fields
.field adobeId:Ljava/lang/String;

.field final apiKey:Ljava/lang/String;

.field isFree:Z

.field isNewPurchase:Z

.field orderId:Ljava/lang/String;

.field price:Ljava/lang/String;

.field final productId:Ljava/lang/String;

.field final purchaseTime:J

.field purchaseToken:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JLjava/lang/String;)V
    .registers 5
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "purchaseTime"    # J
    .param p4, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->productId:Ljava/lang/String;

    .line 31
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->purchaseTime:J

    .line 32
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->apiKey:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public toJSON(Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 120
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 121
    .local v0, "json":Lorg/json/JSONObject;
    const-string v1, "apiKey"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->apiKey:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    const-string v1, "sdkVersion"

    const/16 v2, 0x1a5

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    const-string v1, "binaryVersion"

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getBinaryVersion(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    const-string v1, "aviaryId"

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getUserUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    const-string v1, "productId"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->productId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    const-string v1, "packageName"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    const-string v1, "country"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    const-string v1, "language"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    const-string v1, "purchaseTime"

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->purchaseTime:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 130
    const-string v2, "isProduction"

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersion(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_9e

    const/4 v1, 0x1

    :goto_5f
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 132
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->adobeId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_71

    .line 133
    const-string v1, "adobeId"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->adobeId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    :cond_71
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    if-nez v1, :cond_9d

    .line 137
    const-string v1, "isNewPurchase"

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isNewPurchase:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 139
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->orderId:Ljava/lang/String;

    if-eqz v1, :cond_87

    const-string v1, "orderId"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->orderId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    :cond_87
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->purchaseToken:Ljava/lang/String;

    if-eqz v1, :cond_92

    const-string v1, "receipt"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->purchaseToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 141
    :cond_92
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->price:Ljava/lang/String;

    if-eqz v1, :cond_9d

    const-string v1, "price"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->price:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    :cond_9d
    return-object v0

    .line 130
    :cond_9e
    const/4 v1, 0x0

    goto :goto_5f
.end method
