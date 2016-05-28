.class public Lcom/facebook/ads/internal/view/d;
.super Landroid/webkit/WebView;


# instance fields
.field private a:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public b()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/d;->a:Z

    return v0
.end method

.method public destroy()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/view/d;->a:Z

    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method
