.class final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;
.source "CdsManifestPackContentDownloader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3
    .param p1, "serverRoot"    # Ljava/lang/String;
    .param p2, "debug"    # Z

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;-><init>(Ljava/lang/String;Z)V

    .line 18
    return-void
.end method


# virtual methods
.method parseStream(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    .registers 5
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;-><init>()V

    .line 23
    .local v0, "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->parse(Ljava/io/InputStream;)I

    move-result v1

    if-eqz v1, :cond_15

    .line 24
    new-instance v1, Lorg/json/JSONException;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 26
    :cond_15
    return-object v0
.end method

.method bridge synthetic parseStream(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 15
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;->parseStream(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;

    move-result-object v0

    return-object v0
.end method
