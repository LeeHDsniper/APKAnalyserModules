.class Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;
.super Ljava/lang/Object;
.source "ColorSplashPanel.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 58
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_38

    .line 82
    :cond_5
    :goto_5
    const/4 v0, 0x0

    return v0

    .line 60
    :pswitch_7
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->onProgressStart()V

    goto :goto_5

    .line 64
    :pswitch_d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->onProgressEnd()V

    goto :goto_5

    .line 68
    :pswitch_13
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    if-eqz v0, :cond_5

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    goto :goto_5

    .line 74
    :pswitch_29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->setIsChanged(Z)V

    goto :goto_5

    .line 58
    :pswitch_data_38
    .packed-switch 0x3e8
        :pswitch_29
        :pswitch_7
        :pswitch_d
        :pswitch_13
    .end packed-switch
.end method
