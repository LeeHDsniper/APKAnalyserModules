.class public Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
.super Ljava/lang/Object;
.source "AdobeDCXManifestNode.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected _dict:Lorg/json/JSONObject;

.field protected _manifest:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;",
            ">;"
        }
    .end annotation
.end field

.field protected _parentPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)V
    .registers 5
    .param p1, "dict"    # Lorg/json/JSONObject;
    .param p2, "manifest"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .param p3, "parentPath"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_dict:Lorg/json/JSONObject;

    .line 59
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_manifest:Ljava/lang/ref/WeakReference;

    .line 60
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_parentPath:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public static createManifestNodeFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .registers 4
    .param p0, "nodeDict"    # Lorg/json/JSONObject;
    .param p1, "manifest"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .param p2, "parentPath"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;-><init>(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 188
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->$assertionsDisabled:Z

    if-nez v0, :cond_33

    const-string v0, "children"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    const-string v0, "components"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    :cond_14
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The key "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is a reserved key for a AdobeDCXManifestNode."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 189
    :cond_33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_dict:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAbsoluteIndex()J
    .registers 3

    .prologue
    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_manifest:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_manifest:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_manifest:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getAbsoluteIndexOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)J

    move-result-wide v0

    .line 204
    :goto_18
    return-wide v0

    :cond_19
    const-wide/16 v0, -0x1

    goto :goto_18
.end method

.method public getAbsolutePath()Ljava/lang/String;
    .registers 3

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getPath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getParentPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method public getName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 121
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_dict:Lorg/json/JSONObject;

    const-string v1, "name"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeId()Ljava/lang/String;
    .registers 4

    .prologue
    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_dict:Lorg/json/JSONObject;

    const-string v1, "id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParentPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_parentPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 4

    .prologue
    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_dict:Lorg/json/JSONObject;

    const-string v1, "path"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 4

    .prologue
    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->_dict:Lorg/json/JSONObject;

    const-string v1, "type"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
