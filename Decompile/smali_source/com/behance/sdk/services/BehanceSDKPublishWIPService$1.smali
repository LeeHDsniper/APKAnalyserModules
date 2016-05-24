.class Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPService.java"

# interfaces
.implements Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->publishWIPOnServer(Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private lastBroadcastedProgressPercentage:I

.field final synthetic this$0:Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

.field final synthetic val$httpPost:Lorg/apache/http/client/methods/HttpPost;

.field final synthetic val$serviceParamsDTO:Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;


# direct methods
.method constructor <init>(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;Lorg/apache/http/client/methods/HttpPost;)V
    .registers 5
    .param p1, "this$0"    # Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    .prologue
    .line 327
    iput-object p1, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    iput-object p2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->val$serviceParamsDTO:Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    iput-object p3, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->val$httpPost:Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->lastBroadcastedProgressPercentage:I

    return-void
.end method


# virtual methods
.method public onUploadProgressUpdate(F)V
    .registers 6
    .param p1, "progressPercentage"    # F

    .prologue
    .line 332
    float-to-int v1, p1

    .line 333
    .local v1, "progressPercentInt":I
    rem-int/lit8 v2, v1, 0xa

    if-nez v2, :cond_36

    .line 334
    iget v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->lastBroadcastedProgressPercentage:I

    if-eq v2, v1, :cond_36

    .line 335
    iput v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->lastBroadcastedProgressPercentage:I

    .line 337
    const/16 v2, 0x64

    if-ge v1, v2, :cond_36

    .line 338
    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 339
    .local v0, "imageUploadBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_IN_PROGRESS:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 340
    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    iget-object v3, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->val$serviceParamsDTO:Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    .line 341
    # invokes: Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->convertImageUploadProgressPercentage(Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;I)I
    invoke-static {v2, v3, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->access$000(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;I)I

    move-result v2

    .line 340
    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 342
    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    # invokes: Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V
    invoke-static {v2, v0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->access$100(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    .line 343
    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    # invokes: Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z
    invoke-static {v2}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->access$200(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 344
    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;->val$httpPost:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v2}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 349
    .end local v0    # "imageUploadBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    :cond_36
    return-void
.end method
