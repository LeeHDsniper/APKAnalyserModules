.class Lit/sephiroth/android/library/picasso/Utils$PicassoThread;
.super Ljava/lang/Thread;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PicassoThread"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .registers 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 407
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 408
    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 411
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 412
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 413
    return-void
.end method
