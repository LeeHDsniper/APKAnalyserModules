.class public Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;
.super Ljava/lang/Object;
.source "BehanceSDKWebLinkDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x61f8895daecc7523L


# instance fields
.field private title:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;->title:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;->url:Ljava/lang/String;

    .line 49
    return-void
.end method
