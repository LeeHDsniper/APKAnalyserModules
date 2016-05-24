.class Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;
.super Ljava/lang/Object;
.source "AdobeImageAsyncTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onPreExecute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    .prologue
    .line 48
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 51
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doPreExecute()V

    .line 52
    return-void
.end method
