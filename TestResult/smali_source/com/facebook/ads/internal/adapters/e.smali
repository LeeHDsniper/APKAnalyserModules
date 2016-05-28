.class public Lcom/facebook/ads/internal/adapters/e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/adapters/e$b;,
        Lcom/facebook/ads/internal/adapters/e$a;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private final c:Landroid/content/Context;

.field private final d:Landroid/view/View;

.field private final e:I

.field private final f:Lcom/facebook/ads/internal/adapters/e$a;

.field private final g:Landroid/os/Handler;

.field private final h:Ljava/lang/Runnable;

.field private final i:Z

.field private volatile j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;ILcom/facebook/ads/internal/adapters/e$a;)V
    .registers 11

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/facebook/ads/internal/adapters/e;-><init>(Landroid/content/Context;Landroid/view/View;IZLcom/facebook/ads/internal/adapters/e$a;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;IZLcom/facebook/ads/internal/adapters/e$a;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/ads/internal/adapters/e;->a:I

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/facebook/ads/internal/adapters/e;->b:I

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->g:Landroid/os/Handler;

    new-instance v0, Lcom/facebook/ads/internal/adapters/e$b;

    invoke-direct {v0, p0}, Lcom/facebook/ads/internal/adapters/e$b;-><init>(Lcom/facebook/ads/internal/adapters/e;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->h:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/facebook/ads/internal/adapters/e;->c:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/ads/internal/adapters/e;->d:Landroid/view/View;

    iput p3, p0, Lcom/facebook/ads/internal/adapters/e;->e:I

    iput-object p5, p0, Lcom/facebook/ads/internal/adapters/e;->f:Lcom/facebook/ads/internal/adapters/e$a;

    iput-boolean p4, p0, Lcom/facebook/ads/internal/adapters/e;->i:Z

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/adapters/e;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/e;->i:Z

    return v0
.end method

.method static synthetic a(Lcom/facebook/ads/internal/adapters/e;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/internal/adapters/e;->j:Z

    return p1
.end method

.method static synthetic b(Lcom/facebook/ads/internal/adapters/e;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/e;->j:Z

    return v0
.end method

.method static synthetic c(Lcom/facebook/ads/internal/adapters/e;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->d:Landroid/view/View;

    return-object v0
.end method

.method static synthetic d(Lcom/facebook/ads/internal/adapters/e;)Lcom/facebook/ads/internal/adapters/e$a;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->f:Lcom/facebook/ads/internal/adapters/e$a;

    return-object v0
.end method

.method static synthetic e(Lcom/facebook/ads/internal/adapters/e;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic f(Lcom/facebook/ads/internal/adapters/e;)I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/adapters/e;->e:I

    return v0
.end method

.method static synthetic g(Lcom/facebook/ads/internal/adapters/e;)Ljava/lang/Runnable;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->h:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic h(Lcom/facebook/ads/internal/adapters/e;)I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/adapters/e;->b:I

    return v0
.end method

.method static synthetic i(Lcom/facebook/ads/internal/adapters/e;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->g:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 5

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/e;->i:Z

    if-nez v0, :cond_12

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/e;->j:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->g:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/e;->h:Ljava/lang/Runnable;

    iget v2, p0, Lcom/facebook/ads/internal/adapters/e;->a:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_12
    return-void
.end method

.method public a(I)V
    .registers 2

    iput p1, p0, Lcom/facebook/ads/internal/adapters/e;->a:I

    return-void
.end method

.method public b()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/e;->g:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/e;->h:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(I)V
    .registers 2

    iput p1, p0, Lcom/facebook/ads/internal/adapters/e;->b:I

    return-void
.end method
