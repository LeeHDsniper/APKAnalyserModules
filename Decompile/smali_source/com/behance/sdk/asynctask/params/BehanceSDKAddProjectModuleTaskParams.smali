.class public Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKAddProjectModuleTaskParams.java"


# instance fields
.field private imageFile:Ljava/io/File;

.field private projectID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getImage()Ljava/io/File;
    .registers 2

    .prologue
    .line 19
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;->imageFile:Ljava/io/File;

    return-object v0
.end method

.method public getProjectId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;->projectID:Ljava/lang/String;

    return-object v0
.end method
