.class Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;
.super Ljava/lang/Object;
.source "DelayedSpotDrawPanel.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 46
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_2a

    .line 63
    :cond_5
    :goto_5
    const/4 v0, 0x0

    return v0

    .line 48
    :pswitch_7
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->onProgressStart()V

    goto :goto_5

    .line 52
    :pswitch_d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->onProgressEnd()V

    goto :goto_5

    .line 56
    :pswitch_13
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    if-eqz v0, :cond_5

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    goto :goto_5

    .line 46
    nop

    :pswitch_data_2a
    .packed-switch 0x3e9
        :pswitch_7
        :pswitch_d
        :pswitch_13
    .end packed-switch
.end method
