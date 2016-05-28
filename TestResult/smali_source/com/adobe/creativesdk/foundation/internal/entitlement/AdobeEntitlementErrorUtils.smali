.class public Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementErrorUtils;
.super Ljava/lang/Object;
.source "AdobeEntitlementErrorUtils.java"


# direct methods
.method public static errorWithCode(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
    .registers 6
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;
    .param p1, "underlyingError"    # Ljava/lang/Exception;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "details"    # Ljava/lang/String;

    .prologue
    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 51
    .local v0, "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p2, :cond_c

    .line 53
    const-string v1, "AdobeErrorPathKey"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    :cond_c
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    invoke-direct {v1, p0, p3, v0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/Exception;)V

    return-object v1
.end method
