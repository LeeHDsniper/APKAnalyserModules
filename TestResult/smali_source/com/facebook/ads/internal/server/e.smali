.class public Lcom/facebook/ads/internal/server/e;
.super Lcom/facebook/ads/internal/server/c;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/facebook/ads/internal/dto/c;)V
    .registers 4

    sget-object v0, Lcom/facebook/ads/internal/server/c$a;->b:Lcom/facebook/ads/internal/server/c$a;

    invoke-direct {p0, v0, p2}, Lcom/facebook/ads/internal/server/c;-><init>(Lcom/facebook/ads/internal/server/c$a;Lcom/facebook/ads/internal/dto/c;)V

    iput-object p1, p0, Lcom/facebook/ads/internal/server/e;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/e;->a:Ljava/lang/String;

    return-object v0
.end method
