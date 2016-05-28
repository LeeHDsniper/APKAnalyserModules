.class Lcom/facebook/ads/InterstitialAdActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/InterstitialAdActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/InterstitialAdActivity;


# direct methods
.method constructor <init>(Lcom/facebook/ads/InterstitialAdActivity;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/InterstitialAdActivity$1;->a:Lcom/facebook/ads/InterstitialAdActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAdActivity$1;->a:Lcom/facebook/ads/InterstitialAdActivity;

    invoke-virtual {v0}, Lcom/facebook/ads/InterstitialAdActivity;->finish()V

    return-void
.end method
