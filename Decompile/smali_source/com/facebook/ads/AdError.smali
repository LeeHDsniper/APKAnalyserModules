.class public Lcom/facebook/ads/AdError;
.super Ljava/lang/Object;


# static fields
.field public static final INTERNAL_ERROR:Lcom/facebook/ads/AdError;

.field public static final LOAD_TOO_FREQUENTLY:Lcom/facebook/ads/AdError;

.field public static final MISSING_PROPERTIES:Lcom/facebook/ads/AdError;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final NETWORK_ERROR:Lcom/facebook/ads/AdError;

.field public static final NO_FILL:Lcom/facebook/ads/AdError;

.field public static final SERVER_ERROR:Lcom/facebook/ads/AdError;


# instance fields
.field private final a:I

.field private final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/facebook/ads/AdError;

    const/16 v1, 0x3e8

    const-string v2, "Network Error"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/ads/AdError;->NETWORK_ERROR:Lcom/facebook/ads/AdError;

    new-instance v0, Lcom/facebook/ads/AdError;

    const/16 v1, 0x3e9

    const-string v2, "No Fill"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/ads/AdError;->NO_FILL:Lcom/facebook/ads/AdError;

    new-instance v0, Lcom/facebook/ads/AdError;

    const/16 v1, 0x3ea

    const-string v2, "Ad was re-loaded too frequently"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/ads/AdError;->LOAD_TOO_FREQUENTLY:Lcom/facebook/ads/AdError;

    new-instance v0, Lcom/facebook/ads/AdError;

    const/16 v1, 0x7d0

    const-string v2, "Server Error"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/ads/AdError;->SERVER_ERROR:Lcom/facebook/ads/AdError;

    new-instance v0, Lcom/facebook/ads/AdError;

    const/16 v1, 0x7d1

    const-string v2, "Internal Error"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/ads/AdError;->INTERNAL_ERROR:Lcom/facebook/ads/AdError;

    new-instance v0, Lcom/facebook/ads/AdError;

    const/16 v1, 0x7d2

    const-string v2, "Native ad failed to load due to missing properties"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/AdError;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/ads/AdError;->MISSING_PROPERTIES:Lcom/facebook/ads/AdError;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p2, "unknown error"

    :cond_b
    iput p1, p0, Lcom/facebook/ads/AdError;->a:I

    iput-object p2, p0, Lcom/facebook/ads/AdError;->b:Ljava/lang/String;

    return-void
.end method
