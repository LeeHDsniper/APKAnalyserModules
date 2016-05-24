.class public Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;
.super Ljava/lang/Object;
.source "AdobeCloudUtils.java"


# direct methods
.method public static areValuesEqual(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "list1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    .local p1, "list2":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v4, v5, :cond_38

    const/4 v2, 0x1

    .line 129
    .local v2, "result":Z
    :goto_b
    if-eqz v2, :cond_37

    .line 131
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_11
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_37

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 133
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 135
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 136
    .local v1, "idx":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_3a

    .line 138
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 139
    .local v3, "tmpCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isStrictlyEqual(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v5

    if-nez v5, :cond_11

    .line 141
    const/4 v2, 0x0

    .line 160
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v1    # "idx":I
    .end local v3    # "tmpCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_37
    :goto_37
    return v2

    .line 128
    .end local v2    # "result":Z
    :cond_38
    const/4 v2, 0x0

    goto :goto_b

    .line 147
    .restart local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .restart local v1    # "idx":I
    .restart local v2    # "result":Z
    :cond_3a
    const/4 v2, 0x0

    .line 148
    goto :goto_37

    .line 154
    .end local v1    # "idx":I
    :cond_3c
    const/4 v2, 0x0

    .line 155
    goto :goto_37
.end method

.method public static getCloudsFromUserProfile(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z
    .registers 14
    .param p0, "userProfileItems"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "output":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    const/4 v8, 0x1

    .line 44
    .local v8, "result":Z
    const/4 v5, 0x1

    .line 46
    .local v5, "hasAccessToPublicCloud":Z
    const-string v9, "public_cloud"

    const/4 v10, 0x1

    invoke-virtual {p0, v9, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 49
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAdobeApplication()Z

    move-result v9

    if-eqz v9, :cond_98

    .line 51
    if-eqz p0, :cond_7a

    const-string v9, "endpoints"

    invoke-virtual {p0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_7a

    .line 53
    const-string v9, "endpoints"

    invoke-virtual {p0, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 55
    .local v4, "endpoints":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_24
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v6, v9, :cond_98

    .line 56
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 57
    .local v3, "cloudMeta":Lorg/json/JSONObject;
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;-><init>()V

    .line 58
    .local v2, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-eqz v3, :cond_4e

    .line 59
    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->updateFromDictionary(Lorg/json/JSONObject;)Z

    move-result v9

    if-eqz v9, :cond_4e

    .line 60
    const/4 v0, 0x1

    .line 62
    .local v0, "addCloud":Z
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v9

    if-nez v9, :cond_43

    .line 63
    move v0, v5

    .line 68
    :cond_43
    if-eqz v0, :cond_51

    .line 69
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_51

    .line 70
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .end local v0    # "addCloud":Z
    :cond_4e
    :goto_4e
    add-int/lit8 v6, v6, 0x1

    goto :goto_24

    .line 76
    .restart local v0    # "addCloud":Z
    :cond_51
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 78
    .local v7, "outputCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_5a
    :goto_5a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_73

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 79
    .local v1, "addedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isStrictlyEqual(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v10

    if-nez v10, :cond_5a

    .line 81
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 82
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5a

    .line 86
    .end local v1    # "addedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_73
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 87
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_4e

    .line 95
    .end local v0    # "addCloud":Z
    .end local v2    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v3    # "cloudMeta":Lorg/json/JSONObject;
    .end local v4    # "endpoints":Lorg/json/JSONArray;
    .end local v6    # "i":I
    .end local v7    # "outputCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :cond_7a
    if-eqz p0, :cond_8e

    const-string v9, "endpoints"

    invoke-virtual {p0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_8e

    .line 97
    new-instance v9, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    sget-object v10, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorNoCloudsAvailable:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    const-string v11, "No clouds are available for this user."

    invoke-direct {v9, v10, v11}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/String;)V

    throw v9

    .line 102
    :cond_8e
    new-instance v9, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    sget-object v10, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    const-string v11, "Query for clouds returned an unexpected response."

    invoke-direct {v9, v10, v11}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/String;)V

    throw v9

    .line 107
    :cond_98
    return v8
.end method

.method public static isCloudValid(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    .registers 5
    .param p0, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    const/4 v2, 0x0

    .line 112
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEndpoints()Ljava/util/HashMap;

    move-result-object v0

    .line 113
    .local v0, "endpoints":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;>;"
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v3

    if-nez v3, :cond_e

    .line 123
    :cond_d
    :goto_d
    return v2

    .line 116
    :cond_e
    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .line 117
    .local v1, "storageEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    if-eqz v1, :cond_d

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    if-eqz v3, :cond_d

    .line 120
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    if-eqz v3, :cond_d

    .line 123
    const/4 v2, 0x1

    goto :goto_d
.end method
