.class Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectService.java"

# interfaces
.implements Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/services/BehanceSDKPublishProjectService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProjectModuleUploadEntityWrapperCallback"
.end annotation


# instance fields
.field private final httpPost:Lorg/apache/http/client/methods/HttpPost;

.field private lastBroadcastedProgressPercentage:I

.field private final serviceParams:Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

.field private final statusDTO:Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

.field final synthetic this$0:Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

.field private final uploadedModulesCount:I


# direct methods
.method private constructor <init>(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;Lorg/apache/http/client/methods/HttpPost;I)V
    .registers 7
    .param p2, "serviceParams"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p3, "statusDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    .param p4, "uploadModuleHttpPost"    # Lorg/apache/http/client/methods/HttpPost;
    .param p5, "uploadedModulesCount"    # I

    .prologue
    .line 724
    iput-object p1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 720
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->lastBroadcastedProgressPercentage:I

    .line 725
    iput-object p2, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->serviceParams:Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    .line 726
    iput p5, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->uploadedModulesCount:I

    .line 727
    iput-object p4, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 728
    iput-object p3, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->statusDTO:Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    .line 729
    return-void
.end method

.method synthetic constructor <init>(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;Lorg/apache/http/client/methods/HttpPost;ILcom/behance/sdk/services/BehanceSDKPublishProjectService$1;)V
    .registers 7
    .param p1, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishProjectService;
    .param p2, "x1"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p3, "x2"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    .param p4, "x3"    # Lorg/apache/http/client/methods/HttpPost;
    .param p5, "x4"    # I
    .param p6, "x5"    # Lcom/behance/sdk/services/BehanceSDKPublishProjectService$1;

    .prologue
    .line 715
    invoke-direct/range {p0 .. p5}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;-><init>(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;Lorg/apache/http/client/methods/HttpPost;I)V

    return-void
.end method


# virtual methods
.method public onUploadProgressUpdate(F)V
    .registers 8
    .param p1, "progressPercentage"    # F

    .prologue
    .line 733
    float-to-int v0, p1

    .line 734
    .local v0, "progressPercentInt":I
    rem-int/lit8 v1, v0, 0xa

    if-nez v1, :cond_3b

    .line 735
    iget v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->lastBroadcastedProgressPercentage:I

    if-eq v1, v0, :cond_3b

    .line 736
    iput v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->lastBroadcastedProgressPercentage:I

    .line 738
    const/16 v1, 0x64

    if-ge v0, v1, :cond_3b

    .line 739
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->statusDTO:Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->MODULES_UPLOAD_IN_PROGRESS:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 740
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->statusDTO:Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    iget-object v3, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->serviceParams:Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    iget v4, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->uploadedModulesCount:I

    iget v5, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->lastBroadcastedProgressPercentage:I

    # invokes: Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->convertModuleUploadProgressPercentage(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;II)I
    invoke-static {v2, v3, v4, v5}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->access$100(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;II)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 741
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->statusDTO:Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    # invokes: Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V
    invoke-static {v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->access$200(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 743
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->this$0:Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    # invokes: Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z
    invoke-static {v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->access$300(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 744
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v1}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 749
    :cond_3b
    return-void
.end method
