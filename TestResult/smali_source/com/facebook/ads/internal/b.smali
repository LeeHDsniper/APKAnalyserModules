.class public Lcom/facebook/ads/internal/b;
.super Ljava/lang/Object;


# instance fields
.field private final a:Lcom/facebook/ads/internal/AdErrorType;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/ads/internal/AdErrorType;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lcom/facebook/ads/internal/AdErrorType;->getDefaultErrorMessage()Ljava/lang/String;

    move-result-object p2

    :cond_d
    iput-object p1, p0, Lcom/facebook/ads/internal/b;->a:Lcom/facebook/ads/internal/AdErrorType;

    iput-object p2, p0, Lcom/facebook/ads/internal/b;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()Lcom/facebook/ads/internal/AdErrorType;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/b;->a:Lcom/facebook/ads/internal/AdErrorType;

    return-object v0
.end method

.method public b()Lcom/facebook/ads/AdError;
    .registers 4

    iget-object v0, p0, Lcom/facebook/ads/internal/b;->a:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/AdErrorType;->a()Z

    move-result v0

    if-eqz v0, :cond_16

    new-instance v0, Lcom/facebook/ads/AdError;

    iget-object v1, p0, Lcom/facebook/ads/internal/b;->a:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/AdErrorType;->getErrorCode()I

    move-result v1

    iget-object v2, p0, Lcom/facebook/ads/internal/b;->b:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    :goto_15
    return-object v0

    :cond_16
    new-instance v0, Lcom/facebook/ads/AdError;

    sget-object v1, Lcom/facebook/ads/internal/AdErrorType;->UNKNOWN_ERROR:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/AdErrorType;->getErrorCode()I

    move-result v1

    sget-object v2, Lcom/facebook/ads/internal/AdErrorType;->UNKNOWN_ERROR:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/AdErrorType;->getDefaultErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    goto :goto_15
.end method
