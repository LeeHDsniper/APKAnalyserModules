.class public Lcom/behance/sdk/util/BehanceSDKFontUtils;
.super Ljava/lang/Object;
.source "BehanceSDKFontUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;,
        Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;
    }
.end annotation


# static fields
.field private static fonts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;",
            "Ljava/util/Map",
            "<",
            "Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;",
            "Landroid/graphics/Typeface;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const-class v0, Lcom/behance/sdk/util/BehanceSDKFontUtils;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static getFontFromRes(Landroid/content/Context;IZ)Landroid/graphics/Typeface;
    .registers 17
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resId"    # I
    .param p2, "deleteAfterwards"    # Z

    .prologue
    .line 105
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v8

    .line 106
    .local v8, "resEntryName":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/tmp_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".raw"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 109
    .local v7, "outPath":Ljava/lang/String;
    const/4 v3, 0x0

    .line 111
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_2a
    new-instance v4, Ljava/io/FileInputStream;

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_34
    .catch Ljava/io/FileNotFoundException; {:try_start_2a .. :try_end_34} :catch_64

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .local v4, "fis":Ljava/io/FileInputStream;
    move-object v3, v4

    .line 116
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :goto_35
    if-eqz v3, :cond_9a

    .line 118
    :try_start_37
    sget-object v10, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Found cached font:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " at location "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-interface {v10, v11, v12}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 119
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_5f} :catch_8b

    .line 124
    :goto_5f
    invoke-static {v7}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v9

    .line 155
    :goto_63
    return-object v9

    .line 112
    :catch_64
    move-exception v2

    .line 113
    .local v2, "e":Ljava/io/FileNotFoundException;
    sget-object v10, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Font "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " is not cached at location "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-interface {v10, v11, v12}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_35

    .line 120
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :catch_8b
    move-exception v2

    .line 121
    .local v2, "e":Ljava/io/IOException;
    sget-object v10, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v11, "Exception while closing the inputstream "

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-interface {v10, v11, v12}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_5f

    .line 127
    .end local v2    # "e":Ljava/io/IOException;
    :cond_9a
    const/4 v5, 0x0

    .line 129
    .local v5, "is":Ljava/io/InputStream;
    :try_start_9b
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;
    :try_end_a2
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_9b .. :try_end_a2} :catch_cf

    move-result-object v5

    .line 135
    :goto_a3
    :try_start_a3
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    move-result v10

    new-array v1, v10, [B

    .line 136
    .local v1, "buffer":[B
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v10}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 138
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    const/4 v6, 0x0

    .line 139
    .local v6, "l":I
    :goto_b4
    invoke-virtual {v5, v1}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :cond_f2

    .line 140
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10, v6}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_be
    .catch Ljava/io/IOException; {:try_start_a3 .. :try_end_be} :catch_bf

    goto :goto_b4

    .line 143
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .end local v1    # "buffer":[B
    .end local v6    # "l":I
    :catch_bf
    move-exception v2

    .line 144
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v10, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v11, "Error reading in font!"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-interface {v10, v11, v12}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 145
    const/4 v9, 0x0

    goto :goto_63

    .line 130
    .end local v2    # "e":Ljava/io/IOException;
    :catch_cf
    move-exception v2

    .line 131
    .local v2, "e":Landroid/content/res/Resources$NotFoundException;
    sget-object v10, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Could not find font "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " in resources!"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-interface {v10, v11, v12}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_a3

    .line 142
    .end local v2    # "e":Landroid/content/res/Resources$NotFoundException;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "buffer":[B
    .restart local v6    # "l":I
    :cond_f2
    :try_start_f2
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_f5
    .catch Ljava/io/IOException; {:try_start_f2 .. :try_end_f5} :catch_bf

    .line 148
    invoke-static {v7}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v9

    .line 150
    .local v9, "tf":Landroid/graphics/Typeface;
    if-eqz p2, :cond_103

    .line 152
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 154
    :cond_103
    sget-object v10, Lcom/behance/sdk/util/BehanceSDKFontUtils;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v11, "Successfully loaded font."

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-interface {v10, v11, v12}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_63
.end method

.method private static initializeFonts(Landroid/content/Context;)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 60
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 62
    .local v0, "adobeClean":Ljava/util/Map;, "Ljava/util/Map<Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;Landroid/graphics/Typeface;>;"
    sget v4, Lcom/behance/sdk/R$raw;->adobeclean_regular:I

    invoke-static {p0, v4, v5}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->getFontFromRes(Landroid/content/Context;IZ)Landroid/graphics/Typeface;

    move-result-object v3

    .line 63
    .local v3, "adobeCleanRegular":Landroid/graphics/Typeface;
    sget-object v4, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->REGULAR:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget v4, Lcom/behance/sdk/R$raw;->adobeclean_bold:I

    invoke-static {p0, v4, v5}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->getFontFromRes(Landroid/content/Context;IZ)Landroid/graphics/Typeface;

    move-result-object v1

    .line 65
    .local v1, "adobeCleanBold":Landroid/graphics/Typeface;
    sget-object v4, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->BOLD:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget v4, Lcom/behance/sdk/R$raw;->adobeclean_light:I

    invoke-static {p0, v4, v5}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->getFontFromRes(Landroid/content/Context;IZ)Landroid/graphics/Typeface;

    move-result-object v2

    .line 67
    .local v2, "adobeCleanLight":Landroid/graphics/Typeface;
    sget-object v4, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v4, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    sget-object v5, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method private static processsViewGroup(Landroid/view/ViewGroup;ILcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V
    .registers 7
    .param p0, "v"    # Landroid/view/ViewGroup;
    .param p1, "len"    # I
    .param p2, "font"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
    .param p3, "style"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    .prologue
    .line 73
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p1, :cond_1d

    .line 74
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 75
    .local v0, "c":Landroid/view/View;
    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_13

    .line 76
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "c":Landroid/view/View;
    invoke-static {v0, p2, p3}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/widget/TextView;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    .line 73
    :cond_10
    :goto_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 77
    .restart local v0    # "c":Landroid/view/View;
    :cond_13
    instance-of v2, v0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_10

    .line 78
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "c":Landroid/view/View;
    invoke-static {v0, p2, p3}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/view/ViewGroup;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    goto :goto_10

    .line 81
    :cond_1d
    return-void
.end method

.method public static setAdobeCleanFont(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "topView"    # Landroid/view/View;
    .param p2, "fontName"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 160
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->BOLD:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-virtual {v0}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 161
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->BOLD:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-static {p0, p1, v0, v1}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/content/Context;Landroid/view/View;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    .line 169
    :goto_17
    return-void

    .line 162
    :cond_18
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->REGULAR:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-virtual {v0}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 163
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->REGULAR:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-static {p0, p1, v0, v1}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/content/Context;Landroid/view/View;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    goto :goto_17

    .line 164
    :cond_30
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-virtual {v0}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 165
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-static {p0, p1, v0, v1}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/content/Context;Landroid/view/View;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    goto :goto_17

    .line 167
    :cond_48
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-static {p0, p1, v0, v1}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/content/Context;Landroid/view/View;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    goto :goto_17
.end method

.method public static setCustomFont(Landroid/content/Context;Landroid/view/View;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "topView"    # Landroid/view/View;
    .param p2, "font"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
    .param p3, "style"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    .prologue
    .line 49
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    if-eqz v0, :cond_c

    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 50
    :cond_c
    invoke-static {p0}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->initializeFonts(Landroid/content/Context;)V

    .line 52
    :cond_f
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_19

    .line 53
    check-cast p1, Landroid/view/ViewGroup;

    .end local p1    # "topView":Landroid/view/View;
    invoke-static {p1, p2, p3}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/view/ViewGroup;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    .line 57
    :cond_18
    :goto_18
    return-void

    .line 54
    .restart local p1    # "topView":Landroid/view/View;
    :cond_19
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_18

    .line 55
    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "topView":Landroid/view/View;
    invoke-static {p1, p2, p3}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setCustomFont(Landroid/widget/TextView;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    goto :goto_18
.end method

.method private static setCustomFont(Landroid/view/ViewGroup;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V
    .registers 4
    .param p0, "v"    # Landroid/view/ViewGroup;
    .param p1, "font"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
    .param p2, "style"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    .prologue
    .line 98
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 99
    .local v0, "len":I
    invoke-static {p0, v0, p1, p2}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->processsViewGroup(Landroid/view/ViewGroup;ILcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V

    .line 100
    return-void
.end method

.method private static setCustomFont(Landroid/widget/TextView;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;)V
    .registers 6
    .param p0, "c"    # Landroid/widget/TextView;
    .param p1, "font"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
    .param p2, "style"    # Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    .prologue
    .line 85
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    if-eqz v2, :cond_21

    sget-object v2, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_21

    .line 86
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKFontUtils;->fonts:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 87
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;Landroid/graphics/Typeface;>;"
    if-eqz v0, :cond_21

    .line 88
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    .line 89
    .local v1, "typeface":Landroid/graphics/Typeface;
    if-eqz v1, :cond_21

    .line 90
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 94
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;Landroid/graphics/Typeface;>;"
    .end local v1    # "typeface":Landroid/graphics/Typeface;
    :cond_21
    return-void
.end method
