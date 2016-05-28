.class Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;
.super Landroid/os/HandlerThread;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DispatcherThread"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 565
    const-string v0, "Picasso-Dispatcher"

    const/16 v1, 0xa

    invoke-direct {p0, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 566
    return-void
.end method
