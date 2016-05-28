.class Lcom/localytics/android/UploadHandler$2;
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

.field final synthetic val$rows:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lcom/localytics/android/UploadHandler;Ljava/lang/StringBuilder;)V
    .registers 3

    .prologue
    .line 280
    iput-object p1, p0, Lcom/localytics/android/UploadHandler$2;->this$0:Lcom/localytics/android/UploadHandler;

    iput-object p2, p0, Lcom/localytics/android/UploadHandler$2;->val$rows:Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 283
    iget-object v0, p0, Lcom/localytics/android/UploadHandler$2;->this$0:Lcom/localytics/android/UploadHandler;

    iget-object v0, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    iget-object v1, p0, Lcom/localytics/android/UploadHandler$2;->val$rows:Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lcom/localytics/android/UploadHandler;->deleteProfileAttribute(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/StringBuilder;)V

    .line 284
    return-void
.end method
