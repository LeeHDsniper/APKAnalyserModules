.class public Lcom/facebook/ads/internal/view/a$c;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/view/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/internal/view/a;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/ads/internal/view/a;)V
    .registers 3

    iput-object p1, p0, Lcom/facebook/ads/internal/view/a$c;->a:Lcom/facebook/ads/internal/view/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Lcom/facebook/ads/internal/view/a$c;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/view/a$c;->b:Ljava/lang/String;

    return-void
.end method
