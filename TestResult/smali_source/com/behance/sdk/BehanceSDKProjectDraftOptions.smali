.class public Lcom/behance/sdk/BehanceSDKProjectDraftOptions;
.super Ljava/lang/Object;
.source "BehanceSDKProjectDraftOptions.java"


# instance fields
.field private coverImage:Ljava/io/File;

.field private creativeFields:Ljava/lang/String;

.field private projectContainsAdultContent:Z

.field private projectCopyrightSettings:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field private projectDescription:Ljava/lang/String;

.field private projectTags:Ljava/lang/String;

.field private projectTitle:Ljava/lang/String;


# virtual methods
.method public getCoverImage()Ljava/io/File;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->coverImage:Ljava/io/File;

    return-object v0
.end method

.method public getCreativeFields()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->creativeFields:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectCopyrightSettings()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->projectCopyrightSettings:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-object v0
.end method

.method public getProjectDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->projectDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectTags()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->projectTags:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->projectTitle:Ljava/lang/String;

    return-object v0
.end method

.method public isProjectContainsAdultContent()Z
    .registers 2

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->projectContainsAdultContent:Z

    return v0
.end method
