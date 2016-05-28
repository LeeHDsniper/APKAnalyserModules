.class public Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;
.super Ljava/lang/Object;
.source "SystemUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CpuInfo"
.end annotation


# static fields
.field private static mCpuKiloHz:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const/4 v0, 0x0

    sput v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->mCpuKiloHz:I

    return-void
.end method

.method public static getCpuFrequencyMax()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    sget v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->mCpuKiloHz:I

    if-nez v4, :cond_1b

    .line 74
    const/4 v1, 0x0

    .line 76
    .local v1, "file":Ljava/io/RandomAccessFile;
    :try_start_5
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v4, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"

    const-string v5, "r"

    invoke-direct {v2, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_e} :catch_1e
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_e} :catch_26
    .catchall {:try_start_5 .. :try_end_e} :catchall_2e

    .line 77
    .end local v1    # "file":Ljava/io/RandomAccessFile;
    .local v2, "file":Ljava/io/RandomAccessFile;
    :try_start_e
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "line":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    sput v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->mCpuKiloHz:I
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_18} :catch_39
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_18} :catch_36
    .catchall {:try_start_e .. :try_end_18} :catchall_33

    .line 84
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 88
    .end local v2    # "file":Ljava/io/RandomAccessFile;
    .end local v3    # "line":Ljava/lang/String;
    .local v0, "e":Ljava/io/IOException;
    .restart local v1    # "file":Ljava/io/RandomAccessFile;
    :cond_1b
    :goto_1b
    sget v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->mCpuKiloHz:I

    return v4

    .line 79
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1e
    move-exception v0

    .line 80
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_1f
    :try_start_1f
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_2e

    .line 84
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_1b

    .line 81
    .end local v0    # "e":Ljava/io/IOException;
    :catch_26
    move-exception v0

    .line 82
    .local v0, "e":Ljava/lang/NumberFormatException;
    :goto_27
    :try_start_27
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_2e

    .line 84
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_1b

    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :catchall_2e
    move-exception v4

    :goto_2f
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v4

    .end local v1    # "file":Ljava/io/RandomAccessFile;
    .restart local v2    # "file":Ljava/io/RandomAccessFile;
    :catchall_33
    move-exception v4

    move-object v1, v2

    .end local v2    # "file":Ljava/io/RandomAccessFile;
    .restart local v1    # "file":Ljava/io/RandomAccessFile;
    goto :goto_2f

    .line 81
    .end local v1    # "file":Ljava/io/RandomAccessFile;
    .restart local v2    # "file":Ljava/io/RandomAccessFile;
    :catch_36
    move-exception v0

    move-object v1, v2

    .end local v2    # "file":Ljava/io/RandomAccessFile;
    .restart local v1    # "file":Ljava/io/RandomAccessFile;
    goto :goto_27

    .line 79
    .end local v1    # "file":Ljava/io/RandomAccessFile;
    .restart local v2    # "file":Ljava/io/RandomAccessFile;
    :catch_39
    move-exception v0

    move-object v1, v2

    .end local v2    # "file":Ljava/io/RandomAccessFile;
    .restart local v1    # "file":Ljava/io/RandomAccessFile;
    goto :goto_1f
.end method

.method public static getCpuMhz()I
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 99
    :try_start_1
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->getCpuFrequencyMax()I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_a

    move-result v1

    .line 104
    .local v1, "kiloHZ":I
    if-lez v1, :cond_9

    .line 105
    div-int/lit16 v2, v1, 0x3e8

    .line 107
    :cond_9
    :goto_9
    return v2

    .line 100
    .end local v1    # "kiloHZ":I
    :catch_a
    move-exception v0

    .line 101
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_9
.end method
