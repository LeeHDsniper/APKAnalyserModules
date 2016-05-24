.class public Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;
.super Ljava/lang/Object;
.source "BehanceSDKImageDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x394b5bd62e9c06b7L


# instance fields
.field private height:I

.field private url:Ljava/lang/String;

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;->url:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public static getNewInstance(Ljava/lang/String;)Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;
    .registers 2
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 60
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;

    invoke-direct {v0, p0}, Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
