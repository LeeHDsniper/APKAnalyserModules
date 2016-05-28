.class Lcom/localytics/android/UploadHandler$1;
.super Ljava/lang/Object;
.source "UploadHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/UploadHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/UploadHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/UploadHandler;)V
    .registers 2

    .prologue
    .line 219
    iput-object p1, p0, Lcom/localytics/android/UploadHandler$1;->this$0:Lcom/localytics/android/UploadHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/localytics/android/UploadHandler$1;->this$0:Lcom/localytics/android/UploadHandler;

    iget-object v0, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v0}, Lcom/localytics/android/UploadHandler;->deleteBlobsAndSessions(Lcom/localytics/android/LocalyticsProvider;)V

    .line 223
    return-void
.end method
