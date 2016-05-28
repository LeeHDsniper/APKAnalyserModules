.class public Lcom/facebook/ads/internal/server/c;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/server/c$a;
    }
.end annotation


# instance fields
.field private a:Lcom/facebook/ads/internal/dto/c;

.field private b:Lcom/facebook/ads/internal/server/c$a;


# direct methods
.method public constructor <init>(Lcom/facebook/ads/internal/server/c$a;Lcom/facebook/ads/internal/dto/c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/internal/server/c;->b:Lcom/facebook/ads/internal/server/c$a;

    iput-object p2, p0, Lcom/facebook/ads/internal/server/c;->a:Lcom/facebook/ads/internal/dto/c;

    return-void
.end method


# virtual methods
.method public a()Lcom/facebook/ads/internal/server/c$a;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/c;->b:Lcom/facebook/ads/internal/server/c$a;

    return-object v0
.end method

.method public b()Lcom/facebook/ads/internal/dto/c;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/c;->a:Lcom/facebook/ads/internal/dto/c;

    return-object v0
.end method
