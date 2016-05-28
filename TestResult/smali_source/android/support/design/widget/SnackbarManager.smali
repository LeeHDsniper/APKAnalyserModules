.class Landroid/support/design/widget/SnackbarManager;
.super Ljava/lang/Object;
.source "SnackbarManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/SnackbarManager$SnackbarRecord;,
        Landroid/support/design/widget/SnackbarManager$Callback;
    }
.end annotation


# static fields
.field private static sSnackbarManager:Landroid/support/design/widget/SnackbarManager;


# instance fields
.field private mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

.field private final mHandler:Landroid/os/Handler;

.field private final mLock:Ljava/lang/Object;

.field private mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;


# direct methods
.method private constructor <init>()V
    .registers 4

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Landroid/support/design/widget/SnackbarManager$1;

    invoke-direct {v2, p0}, Landroid/support/design/widget/SnackbarManager$1;-><init>(Landroid/support/design/widget/SnackbarManager;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mHandler:Landroid/os/Handler;

    .line 63
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/SnackbarManager;Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)V
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/SnackbarManager;
    .param p1, "x1"    # Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->handleTimeout(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)V

    return-void
.end method

.method private cancelSnackbarLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Z
    .registers 4
    .param p1, "record"    # Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .prologue
    .line 186
    # getter for: Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->callback:Ljava/lang/ref/WeakReference;
    invoke-static {p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->access$200(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/SnackbarManager$Callback;

    .line 187
    .local v0, "callback":Landroid/support/design/widget/SnackbarManager$Callback;
    if-eqz v0, :cond_11

    .line 188
    invoke-interface {v0}, Landroid/support/design/widget/SnackbarManager$Callback;->dismiss()V

    .line 189
    const/4 v1, 0x1

    .line 191
    :goto_10
    return v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method

.method static getInstance()Landroid/support/design/widget/SnackbarManager;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Landroid/support/design/widget/SnackbarManager;->sSnackbarManager:Landroid/support/design/widget/SnackbarManager;

    if-nez v0, :cond_b

    .line 39
    new-instance v0, Landroid/support/design/widget/SnackbarManager;

    invoke-direct {v0}, Landroid/support/design/widget/SnackbarManager;-><init>()V

    sput-object v0, Landroid/support/design/widget/SnackbarManager;->sSnackbarManager:Landroid/support/design/widget/SnackbarManager;

    .line 41
    :cond_b
    sget-object v0, Landroid/support/design/widget/SnackbarManager;->sSnackbarManager:Landroid/support/design/widget/SnackbarManager;

    return-object v0
.end method

.method private handleTimeout(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)V
    .registers 4
    .param p1, "record"    # Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .prologue
    .line 219
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 220
    :try_start_3
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    if-eq v0, p1, :cond_b

    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    if-ne v0, p1, :cond_e

    .line 221
    :cond_b
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->cancelSnackbarLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Z

    .line 223
    :cond_e
    monitor-exit v1

    .line 224
    return-void

    .line 223
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method private isCurrentSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z
    .registers 3
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 195
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->isSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private isNextSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z
    .registers 3
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 199
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->isSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private scheduleTimeoutLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)V
    .registers 8
    .param p1, "r"    # Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .prologue
    .line 203
    # getter for: Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->duration:I
    invoke-static {p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->access$100(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)I

    move-result v1

    const/4 v2, -0x2

    if-ne v1, v2, :cond_8

    .line 216
    :goto_7
    return-void

    .line 208
    :cond_8
    const/16 v0, 0xabe

    .line 209
    .local v0, "durationMs":I
    # getter for: Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->duration:I
    invoke-static {p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->access$100(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)I

    move-result v1

    if-lez v1, :cond_27

    .line 210
    # getter for: Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->duration:I
    invoke-static {p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->access$100(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)I

    move-result v0

    .line 214
    :cond_14
    :goto_14
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 215
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Landroid/support/design/widget/SnackbarManager;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-static {v2, v3, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_7

    .line 211
    :cond_27
    # getter for: Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->duration:I
    invoke-static {p1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->access$100(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_14

    .line 212
    const/16 v0, 0x5dc

    goto :goto_14
.end method

.method private showNextSnackbarLocked()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 171
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    if-eqz v1, :cond_1c

    .line 172
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    iput-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .line 173
    iput-object v2, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .line 175
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    # getter for: Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->callback:Ljava/lang/ref/WeakReference;
    invoke-static {v1}, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->access$200(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/SnackbarManager$Callback;

    .line 176
    .local v0, "callback":Landroid/support/design/widget/SnackbarManager$Callback;
    if-eqz v0, :cond_1d

    .line 177
    invoke-interface {v0}, Landroid/support/design/widget/SnackbarManager$Callback;->show()V

    .line 183
    .end local v0    # "callback":Landroid/support/design/widget/SnackbarManager$Callback;
    :cond_1c
    :goto_1c
    return-void

    .line 180
    .restart local v0    # "callback":Landroid/support/design/widget/SnackbarManager$Callback;
    :cond_1d
    iput-object v2, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    goto :goto_1c
.end method


# virtual methods
.method public cancelTimeout(Landroid/support/design/widget/SnackbarManager$Callback;)V
    .registers 5
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 141
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 142
    :try_start_3
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->isCurrentSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 143
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 145
    :cond_10
    monitor-exit v1

    .line 146
    return-void

    .line 145
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public dismiss(Landroid/support/design/widget/SnackbarManager$Callback;)V
    .registers 4
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 102
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 103
    :try_start_3
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->isCurrentSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 104
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-direct {p0, v0}, Landroid/support/design/widget/SnackbarManager;->cancelSnackbarLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Z

    .line 106
    :cond_e
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->isNextSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 107
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-direct {p0, v0}, Landroid/support/design/widget/SnackbarManager;->cancelSnackbarLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Z

    .line 109
    :cond_19
    monitor-exit v1

    .line 110
    return-void

    .line 109
    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public onDismissed(Landroid/support/design/widget/SnackbarManager$Callback;)V
    .registers 4
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 117
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 118
    :try_start_3
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->isCurrentSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .line 121
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mNextSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    if-eqz v0, :cond_13

    .line 122
    invoke-direct {p0}, Landroid/support/design/widget/SnackbarManager;->showNextSnackbarLocked()V

    .line 125
    :cond_13
    monitor-exit v1

    .line 126
    return-void

    .line 125
    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public onShown(Landroid/support/design/widget/SnackbarManager$Callback;)V
    .registers 4
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 133
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 134
    :try_start_3
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->isCurrentSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 135
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-direct {p0, v0}, Landroid/support/design/widget/SnackbarManager;->scheduleTimeoutLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)V

    .line 137
    :cond_e
    monitor-exit v1

    .line 138
    return-void

    .line 137
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public restoreTimeout(Landroid/support/design/widget/SnackbarManager$Callback;)V
    .registers 4
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 149
    iget-object v1, p0, Landroid/support/design/widget/SnackbarManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 150
    :try_start_3
    invoke-direct {p0, p1}, Landroid/support/design/widget/SnackbarManager;->isCurrentSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 151
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager;->mCurrentSnackbar:Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    invoke-direct {p0, v0}, Landroid/support/design/widget/SnackbarManager;->scheduleTimeoutLocked(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)V

    .line 153
    :cond_e
    monitor-exit v1

    .line 154
    return-void

    .line 153
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method
