.class Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;
.super Ljava/lang/Object;
.source "AdobeImageAsyncTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onProgressUpdate([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

.field final synthetic val$values:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    .prologue
    .line 97
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;->val$values:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 100
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;->val$values:[Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doProgressUpdate([Ljava/lang/Object;)V

    .line 101
    return-void
.end method
