.class public Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;
.super Lcom/behance/sdk/exception/BehanceSDKException;
.source "BehanceSDKInvalidImageException.java"


# static fields
.field private static final serialVersionUID:J = -0x48bf01569cbc4103L


# instance fields
.field private invalidImage:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>()V

    .line 19
    invoke-virtual {p0, p1}, Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;->setInvalidImage(Ljava/io/File;)V

    .line 20
    return-void
.end method


# virtual methods
.method public setInvalidImage(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;->invalidImage:Ljava/io/File;

    .line 24
    return-void
.end method
