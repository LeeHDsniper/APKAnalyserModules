.class Lit/sephiroth/android/library/picasso/Utils$PicassoThreadFactory;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PicassoThreadFactory"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 398
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 401
    new-instance v0, Lit/sephiroth/android/library/picasso/Utils$PicassoThread;

    invoke-direct {v0, p1}, Lit/sephiroth/android/library/picasso/Utils$PicassoThread;-><init>(Ljava/lang/Runnable;)V

    return-object v0
.end method
