.class public Lcom/adobe/android/ui/widget/VibrationHelper;
.super Ljava/lang/Object;
.source "VibrationHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;
    }
.end annotation


# static fields
.field private static mVibrator:Landroid/os/Vibrator;


# instance fields
.field private mEnabled:Z

.field private final mHandler:Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "enabled"    # Z

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;

    invoke-direct {v0}, Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mHandler:Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;

    .line 17
    invoke-direct {p0, p1}, Lcom/adobe/android/ui/widget/VibrationHelper;->initialize(Landroid/content/Context;)V

    .line 18
    invoke-virtual {p0, p2}, Lcom/adobe/android/ui/widget/VibrationHelper;->setEnabled(Z)V

    .line 20
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/VibrationHelper;->isAvailable()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 21
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/VibrationHelper;->setEnabled(Z)V

    .line 23
    :cond_1a
    return-void
.end method

.method static synthetic access$000()Landroid/os/Vibrator;
    .registers 1

    .prologue
    .line 9
    sget-object v0, Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;

    return-object v0
.end method

.method private initialize(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const-class v2, Lcom/adobe/android/ui/widget/VibrationHelper;

    monitor-enter v2

    .line 27
    :try_start_3
    sget-object v1, Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_1e

    if-nez v1, :cond_11

    .line 29
    :try_start_7
    const-string v1, "vibrator"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    sput-object v1, Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_11} :catch_13
    .catchall {:try_start_7 .. :try_end_11} :catchall_1e

    .line 34
    :cond_11
    :goto_11
    :try_start_11
    monitor-exit v2

    .line 35
    return-void

    .line 30
    :catch_13
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "VibrationHelper"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11

    .line 34
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1e
    move-exception v1

    monitor-exit v2
    :try_end_20
    .catchall {:try_start_11 .. :try_end_20} :catchall_1e

    throw v1
.end method


# virtual methods
.method public enabled()Z
    .registers 2

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mEnabled:Z

    return v0
.end method

.method public final isAvailable()Z
    .registers 2

    .prologue
    .line 46
    sget-object v0, Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setEnabled(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 38
    if-eqz p1, :cond_a

    sget-object v0, Lcom/adobe/android/ui/widget/VibrationHelper;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_7
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mEnabled:Z

    .line 39
    return-void

    .line 38
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public vibrate(I)V
    .registers 5
    .param p1, "milliseconds"    # I

    .prologue
    const/16 v2, 0x65

    .line 54
    iget-boolean v1, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mEnabled:Z

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mHandler:Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;

    if-eqz v1, :cond_1c

    .line 55
    iget-object v1, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mHandler:Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;->removeMessages(I)V

    .line 57
    iget-object v1, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mHandler:Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 58
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 60
    iget-object v1, p0, Lcom/adobe/android/ui/widget/VibrationHelper;->mHandler:Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;

    invoke-virtual {v1, v0}, Lcom/adobe/android/ui/widget/VibrationHelper$VibrationHandler;->sendMessage(Landroid/os/Message;)Z

    .line 62
    .end local v0    # "msg":Landroid/os/Message;
    :cond_1c
    return-void
.end method
