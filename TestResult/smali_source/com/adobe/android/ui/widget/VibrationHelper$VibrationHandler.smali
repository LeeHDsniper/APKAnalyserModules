.class Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;
.super Landroid/os/Handler;
.source "VibrationHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/VibrationHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "VibrationHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 67
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x65

    if-ne v0, v1, :cond_16

    .line 68
    # getter for: Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;
    invoke-static {}, Lcom/adobe/android/ui/widget/VibrationHelper;->access$000()Landroid/os/Vibrator;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 70
    :try_start_c
    # getter for: Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;
    invoke-static {}, Lcom/adobe/android/ui/widget/VibrationHelper;->access$000()Landroid/os/Vibrator;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_16} :catch_17

    .line 75
    :cond_16
    :goto_16
    return-void

    .line 71
    :catch_17
    move-exception v0

    goto :goto_16
.end method
