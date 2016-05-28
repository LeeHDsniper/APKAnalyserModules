.class public Lcom/behance/sdk/project/modules/BaseModule;
.super Ljava/lang/Object;
.source "BaseModule.java"

# interfaces
.implements Lcom/behance/sdk/project/modules/ProjectModule;


# static fields
.field private static final serialVersionUID:J = 0x932ce2e8cee4a7eL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .prologue
    .line 21
    return-void
.end method

.method public deleteFromFileSystem()V
    .registers 1

    .prologue
    .line 26
    return-void
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 29
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .registers 2

    .prologue
    .line 15
    const/4 v0, 0x0

    return-object v0
.end method
