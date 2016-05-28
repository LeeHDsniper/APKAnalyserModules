.class Lcom/facebook/ads/internal/view/a$1;
.super Lcom/facebook/ads/internal/adapters/e$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/internal/view/a;-><init>(Landroid/content/Context;Lcom/facebook/ads/internal/view/a$a;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/internal/view/a$a;

.field final synthetic b:Lcom/facebook/ads/internal/view/a;


# direct methods
.method constructor <init>(Lcom/facebook/ads/internal/view/a;Lcom/facebook/ads/internal/view/a$a;)V
    .registers 3

    iput-object p1, p0, Lcom/facebook/ads/internal/view/a$1;->b:Lcom/facebook/ads/internal/view/a;

    iput-object p2, p0, Lcom/facebook/ads/internal/view/a$1;->a:Lcom/facebook/ads/internal/view/a$a;

    invoke-direct {p0}, Lcom/facebook/ads/internal/adapters/e$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/a$1;->a:Lcom/facebook/ads/internal/view/a$a;

    invoke-interface {v0}, Lcom/facebook/ads/internal/view/a$a;->b()V

    return-void
.end method
