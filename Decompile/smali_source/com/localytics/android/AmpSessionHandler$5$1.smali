.class Lcom/localytics/android/AmpSessionHandler$5$1;
.super Ljava/lang/Object;
.source "AmpSessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler$5;->call([Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/AmpSessionHandler$5;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler$5;)V
    .registers 2

    .prologue
    .line 383
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$5$1;->this$1:Lcom/localytics/android/AmpSessionHandler$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 387
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/localytics/android/AmpSessionHandler$5$1$1;

    invoke-direct {v1, p0}, Lcom/localytics/android/AmpSessionHandler$5$1$1;-><init>(Lcom/localytics/android/AmpSessionHandler$5$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 395
    return-void
.end method
