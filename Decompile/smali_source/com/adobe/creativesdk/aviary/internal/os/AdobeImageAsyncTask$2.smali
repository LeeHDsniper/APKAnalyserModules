.class Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;
.super Ljava/lang/Object;
.source "AdobeImageAsyncTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onPostExecute(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

.field final synthetic val$result:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;Ljava/lang/Object;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    .prologue
    .line 74
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;->val$result:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 77
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;->val$result:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doPostExecute(Ljava/lang/Object;)V

    .line 78
    return-void
.end method
