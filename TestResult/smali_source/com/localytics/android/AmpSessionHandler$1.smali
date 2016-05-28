.class Lcom/localytics/android/AmpSessionHandler$1;
.super Ljava/lang/Object;
.source "AmpSessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 196
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$1;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$1;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-virtual {v0}, Lcom/localytics/android/AmpSessionHandler;->showAmpTest()V

    .line 201
    return-void
.end method
