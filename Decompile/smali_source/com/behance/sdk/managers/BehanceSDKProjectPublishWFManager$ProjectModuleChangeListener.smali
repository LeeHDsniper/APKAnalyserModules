.class public interface abstract Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
.super Ljava/lang/Object;
.source "BehanceSDKProjectPublishWFManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ProjectModuleChangeListener"
.end annotation


# virtual methods
.method public abstract projectModulesChanged(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract rotateImage(Lcom/behance/sdk/project/modules/ImageModule;)V
.end method
