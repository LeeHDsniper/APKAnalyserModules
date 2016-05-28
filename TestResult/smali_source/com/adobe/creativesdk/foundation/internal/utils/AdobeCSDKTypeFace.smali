.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;
.super Ljava/lang/Object;
.source "AdobeCSDKTypeFace.java"


# static fields
.field private static _csdkadobeCleanFont:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->_csdkadobeCleanFont:Landroid/graphics/Typeface;

    return-void
.end method

.method public static getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->_csdkadobeCleanFont:Landroid/graphics/Typeface;

    if-nez v4, :cond_26

    .line 41
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/auth/R$raw;->adobecleanlight:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    .line 42
    .local v3, "robotoStream":Ljava/io/InputStream;
    const-string v4, "temp"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 43
    .local v2, "robotoFont":Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 44
    .local v1, "outputStream":Ljava/io/OutputStream;
    invoke-static {v3, v1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 45
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 46
    invoke-static {v2}, Landroid/graphics/Typeface;->createFromFile(Ljava/io/File;)Landroid/graphics/Typeface;

    move-result-object v4

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->_csdkadobeCleanFont:Landroid/graphics/Typeface;
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_26} :catch_29

    .line 53
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .end local v2    # "robotoFont":Ljava/io/File;
    .end local v3    # "robotoStream":Ljava/io/InputStream;
    :cond_26
    :goto_26
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->_csdkadobeCleanFont:Landroid/graphics/Typeface;

    return-object v4

    .line 48
    :catch_29
    move-exception v0

    .line 50
    .local v0, "exp":Ljava/io/IOException;
    const-string v4, "sans-serif"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->_csdkadobeCleanFont:Landroid/graphics/Typeface;

    goto :goto_26
.end method
