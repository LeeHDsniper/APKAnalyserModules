.class Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;
.super Ljava/lang/Object;
.source "AdobeEntitlementSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResposeToErrorBlock(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

.field final synthetic val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$exception:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    .prologue
    .line 393
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;->val$exception:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 396
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;->val$exception:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 397
    return-void
.end method
