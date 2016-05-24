.class public Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
.super Ljava/lang/Object;
.source "Receipt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private adobeId:Ljava/lang/String;

.field private final apiKey:Ljava/lang/String;

.field private final mIsFree:Z

.field private mIsNewPurchase:Z

.field private mOrderId:Ljava/lang/String;

.field private mPrice:Ljava/lang/String;

.field private mProductId:Ljava/lang/String;

.field private mPurchaseTime:J

.field private mToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .registers 3
    .param p1, "isFree"    # Z
    .param p2, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mIsFree:Z

    .line 48
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->apiKey:Ljava/lang/String;

    .line 49
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljunit/framework/AssertionFailedError;
        }
    .end annotation

    .prologue
    .line 88
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mProductId:Ljava/lang/String;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mPurchaseTime:J

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->apiKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 89
    .local v0, "receipt":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mIsNewPurchase:Z

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isNewPurchase:Z

    .line 91
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mIsFree:Z

    if-eqz v1, :cond_1b

    .line 92
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    .line 107
    :cond_16
    :goto_16
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->adobeId:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->adobeId:Ljava/lang/String;

    .line 108
    return-object v0

    .line 94
    :cond_1b
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    .line 96
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mIsNewPurchase:Z

    if-eqz v1, :cond_16

    .line 97
    const-string v1, "orderId cannot be null"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mOrderId:Ljava/lang/String;

    invoke-static {v1, v2}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    const-string v1, "token cannot be null"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mToken:Ljava/lang/String;

    invoke-static {v1, v2}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    const-string v1, "price cannot be null"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mPrice:Ljava/lang/String;

    invoke-static {v1, v2}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mOrderId:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->orderId:Ljava/lang/String;

    .line 102
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mToken:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->purchaseToken:Ljava/lang/String;

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mPrice:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->price:Ljava/lang/String;

    goto :goto_16
.end method

.method public isNewPurchase(Z)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mIsNewPurchase:Z

    .line 78
    return-object p0
.end method

.method public withOrderId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 2
    .param p1, "orderId"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mOrderId:Ljava/lang/String;

    .line 68
    return-object p0
.end method

.method public withPrice(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 2
    .param p1, "price"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mPrice:Ljava/lang/String;

    .line 73
    return-object p0
.end method

.method public withProductId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 2
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mProductId:Ljava/lang/String;

    .line 58
    return-object p0
.end method

.method public withPurchaseTime(J)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 4
    .param p1, "time"    # J

    .prologue
    .line 62
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mPurchaseTime:J

    .line 63
    return-object p0
.end method

.method public withToken(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 2
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->mToken:Ljava/lang/String;

    .line 83
    return-object p0
.end method

.method public withUserId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    .registers 2
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->adobeId:Ljava/lang/String;

    .line 53
    return-object p0
.end method
