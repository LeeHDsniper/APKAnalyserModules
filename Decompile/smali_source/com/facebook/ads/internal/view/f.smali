.class public Lcom/facebook/ads/internal/view/f;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/view/h;


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Lcom/facebook/ads/internal/view/h$a;

.field private c:Lcom/facebook/ads/internal/view/a;

.field private d:Lcom/facebook/ads/internal/adapters/l;

.field private e:Lcom/facebook/ads/internal/adapters/m;

.field private f:J

.field private g:J

.field private h:Lcom/facebook/ads/internal/util/b$a;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/view/f;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/view/f;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/ads/InterstitialAdActivity;Lcom/facebook/ads/internal/view/h$a;)V
    .registers 7

    const/4 v3, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/facebook/ads/internal/view/f;->b:Lcom/facebook/ads/internal/view/h$a;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/ads/internal/view/f;->f:J

    new-instance v0, Lcom/facebook/ads/internal/view/a;

    new-instance v1, Lcom/facebook/ads/internal/view/f$1;

    invoke-direct {v1, p0, p1}, Lcom/facebook/ads/internal/view/f$1;-><init>(Lcom/facebook/ads/internal/view/f;Lcom/facebook/ads/InterstitialAdActivity;)V

    const/4 v2, 0x1

    invoke-direct {v0, p1, v1, v2}, Lcom/facebook/ads/internal/view/a;-><init>(Landroid/content/Context;Lcom/facebook/ads/internal/view/a$a;I)V

    iput-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    const v1, 0x186a1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/a;->setId(I)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/a;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lcom/facebook/ads/internal/adapters/m;

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    new-instance v2, Lcom/facebook/ads/internal/view/f$2;

    invoke-direct {v2, p0}, Lcom/facebook/ads/internal/view/f$2;-><init>(Lcom/facebook/ads/internal/view/f;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/facebook/ads/internal/adapters/m;-><init>(Landroid/content/Context;Lcom/facebook/ads/internal/view/d;Lcom/facebook/ads/internal/adapters/c;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/view/f;->e:Lcom/facebook/ads/internal/adapters/m;

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->e:Lcom/facebook/ads/internal/adapters/m;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/m;->d()V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-interface {p2, v0}, Lcom/facebook/ads/internal/view/h$a;->a(Landroid/view/View;)V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/view/f;J)J
    .registers 4

    iput-wide p1, p0, Lcom/facebook/ads/internal/view/f;->g:J

    return-wide p1
.end method

.method static synthetic a(Lcom/facebook/ads/internal/view/f;Lcom/facebook/ads/internal/util/b$a;)Lcom/facebook/ads/internal/util/b$a;
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/view/f;->h:Lcom/facebook/ads/internal/util/b$a;

    return-object p1
.end method

.method static synthetic a(Lcom/facebook/ads/internal/view/f;)Lcom/facebook/ads/internal/view/h$a;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->b:Lcom/facebook/ads/internal/view/h$a;

    return-object v0
.end method

.method static synthetic b(Lcom/facebook/ads/internal/view/f;)Lcom/facebook/ads/internal/adapters/m;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->e:Lcom/facebook/ads/internal/adapters/m;

    return-object v0
.end method

.method static synthetic d()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/facebook/ads/internal/view/f;->a:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/a;->onPause()V

    :cond_9
    return-void
.end method

.method public a(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 9

    const/4 v5, 0x0

    if-eqz p2, :cond_40

    const-string v0, "dataModel"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_40

    const-string v0, "dataModel"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/l;->a(Landroid/os/Bundle;)Lcom/facebook/ads/internal/adapters/l;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    if-eqz v0, :cond_3f

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-static {}, Lcom/facebook/ads/internal/util/h;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/l;->d()Ljava/lang/String;

    move-result-object v2

    const-string v3, "text/html"

    const-string v4, "utf-8"

    invoke-virtual/range {v0 .. v5}, Lcom/facebook/ads/internal/view/a;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/adapters/l;->j()I

    move-result v1

    iget-object v2, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/l;->k()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/facebook/ads/internal/view/a;->a(II)V

    :cond_3f
    :goto_3f
    return-void

    :cond_40
    invoke-static {p1}, Lcom/facebook/ads/internal/adapters/l;->b(Landroid/content/Intent;)Lcom/facebook/ads/internal/adapters/l;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    if-eqz v0, :cond_3f

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->e:Lcom/facebook/ads/internal/adapters/m;

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/adapters/m;->a(Lcom/facebook/ads/internal/adapters/l;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-static {}, Lcom/facebook/ads/internal/util/h;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/l;->d()Ljava/lang/String;

    move-result-object v2

    const-string v3, "text/html"

    const-string v4, "utf-8"

    invoke-virtual/range {v0 .. v5}, Lcom/facebook/ads/internal/view/a;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/adapters/l;->j()I

    move-result v1

    iget-object v2, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/l;->k()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/facebook/ads/internal/view/a;->a(II)V

    goto :goto_3f
.end method

.method public a(Landroid/os/Bundle;)V
    .registers 4

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    if-eqz v0, :cond_f

    const-string v0, "dataModel"

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/adapters/l;->l()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_f
    return-void
.end method

.method public b()V
    .registers 5

    iget-wide v0, p0, Lcom/facebook/ads/internal/view/f;->g:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_21

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->h:Lcom/facebook/ads/internal/util/b$a;

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    if-eqz v0, :cond_21

    iget-wide v0, p0, Lcom/facebook/ads/internal/view/f;->g:J

    iget-object v2, p0, Lcom/facebook/ads/internal/view/f;->h:Lcom/facebook/ads/internal/util/b$a;

    iget-object v3, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v3}, Lcom/facebook/ads/internal/adapters/l;->i()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/ads/internal/util/b;->a(JLcom/facebook/ads/internal/util/b$a;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V

    :cond_21
    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/a;->onResume()V

    :cond_2a
    return-void
.end method

.method public c()V
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    if-eqz v0, :cond_15

    iget-wide v0, p0, Lcom/facebook/ads/internal/view/f;->f:J

    sget-object v2, Lcom/facebook/ads/internal/util/b$a;->c:Lcom/facebook/ads/internal/util/b$a;

    iget-object v3, p0, Lcom/facebook/ads/internal/view/f;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v3}, Lcom/facebook/ads/internal/adapters/l;->i()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/ads/internal/util/b;->a(JLcom/facebook/ads/internal/util/b$a;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V

    :cond_15
    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-static {v0}, Lcom/facebook/ads/internal/util/h;->a(Landroid/webkit/WebView;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/a;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/ads/internal/view/f;->c:Lcom/facebook/ads/internal/view/a;

    :cond_26
    return-void
.end method
