.class Lcom/facebook/ads/internal/h$c;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/internal/h;


# direct methods
.method private constructor <init>(Lcom/facebook/ads/internal/h;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/h$c;->a:Lcom/facebook/ads/internal/h;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/h$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/h$c;-><init>(Lcom/facebook/ads/internal/h;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    iget-object v0, p0, Lcom/facebook/ads/internal/h$c;->a:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->h(Lcom/facebook/ads/internal/h;)V

    :cond_11
    :goto_11
    return-void

    :cond_12
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/facebook/ads/internal/h$c;->a:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->b(Lcom/facebook/ads/internal/h;)V

    goto :goto_11
.end method
