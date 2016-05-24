.class Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;
.super Ljava/lang/Object;
.source "AdobeEntitlementSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileFromCache()Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Output"
.end annotation


# instance fields
.field isDone:Z

.field result:Lorg/json/JSONObject;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;->isDone:Z

    .line 301
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;->result:Lorg/json/JSONObject;

    return-void
.end method
