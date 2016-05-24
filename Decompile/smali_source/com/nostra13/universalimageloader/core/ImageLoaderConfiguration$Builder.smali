.class public Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;
.super Ljava/lang/Object;
.source "ImageLoaderConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field public static final DEFAULT_TASK_PROCESSING_TYPE:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;


# instance fields
.field private context:Landroid/content/Context;

.field private customExecutor:Z

.field private customExecutorForCachedImages:Z

.field private decoder:Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;

.field private defaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private denyCacheImageMultipleSizesInMemory:Z

.field private diskCache:Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

.field private diskCacheFileCount:I

.field private diskCacheFileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

.field private diskCacheSize:J

.field private downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

.field private maxImageHeightForDiskCache:I

.field private maxImageHeightForMemoryCache:I

.field private maxImageWidthForDiskCache:I

.field private maxImageWidthForMemoryCache:I

.field private memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

.field private memoryCacheSize:I

.field private processorForDiskCache:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

.field private taskExecutor:Ljava/util/concurrent/Executor;

.field private taskExecutorForCachedImages:Ljava/util/concurrent/Executor;

.field private tasksProcessingType:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

.field private threadPoolSize:I

.field private threadPriority:I

.field private writeLogs:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 162
    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;->FIFO:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    sput-object v0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->DEFAULT_TASK_PROCESSING_TYPE:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    iput v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageWidthForMemoryCache:I

    .line 167
    iput v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageHeightForMemoryCache:I

    .line 168
    iput v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageWidthForDiskCache:I

    .line 169
    iput v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageHeightForDiskCache:I

    .line 170
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->processorForDiskCache:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    .line 172
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    .line 173
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutorForCachedImages:Ljava/util/concurrent/Executor;

    .line 174
    iput-boolean v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->customExecutor:Z

    .line 175
    iput-boolean v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->customExecutorForCachedImages:Z

    .line 177
    const/4 v0, 0x3

    iput v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPoolSize:I

    .line 178
    const/4 v0, 0x4

    iput v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPriority:I

    .line 179
    iput-boolean v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->denyCacheImageMultipleSizesInMemory:Z

    .line 180
    sget-object v0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->DEFAULT_TASK_PROCESSING_TYPE:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->tasksProcessingType:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    .line 182
    iput v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCacheSize:I

    .line 183
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheSize:J

    .line 184
    iput v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheFileCount:I

    .line 186
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    .line 187
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCache:Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

    .line 188
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheFileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    .line 189
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    .line 191
    iput-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->defaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .line 193
    iput-boolean v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->writeLogs:Z

    .line 196
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->context:Landroid/content/Context;

    .line 197
    return-void
.end method

.method static synthetic access$000(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageWidthForMemoryCache:I

    return v0
.end method

.method static synthetic access$1000(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->tasksProcessingType:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/cache/disc/DiskCache;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCache:Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->defaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->decoder:Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->customExecutor:Z

    return v0
.end method

.method static synthetic access$1700(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->customExecutorForCachedImages:Z

    return v0
.end method

.method static synthetic access$1800(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->writeLogs:Z

    return v0
.end method

.method static synthetic access$200(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageHeightForMemoryCache:I

    return v0
.end method

.method static synthetic access$300(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageWidthForDiskCache:I

    return v0
.end method

.method static synthetic access$400(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->maxImageHeightForDiskCache:I

    return v0
.end method

.method static synthetic access$500(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->processorForDiskCache:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    return-object v0
.end method

.method static synthetic access$600(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Ljava/util/concurrent/Executor;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic access$700(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)Ljava/util/concurrent/Executor;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutorForCachedImages:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic access$800(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPoolSize:I

    return v0
.end method

.method static synthetic access$900(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;

    .prologue
    .line 149
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPriority:I

    return v0
.end method

.method private initEmptyFieldsWithDefaultValues()V
    .registers 6

    .prologue
    const/4 v3, 0x1

    .line 564
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    if-nez v0, :cond_7d

    .line 565
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPoolSize:I

    iget v1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPriority:I

    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->tasksProcessingType:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    invoke-static {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createExecutor(IILcom/nostra13/universalimageloader/core/assist/QueueProcessingType;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    .line 570
    :goto_11
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutorForCachedImages:Ljava/util/concurrent/Executor;

    if-nez v0, :cond_80

    .line 571
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPoolSize:I

    iget v1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->threadPriority:I

    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->tasksProcessingType:Lcom/nostra13/universalimageloader/core/assist/QueueProcessingType;

    invoke-static {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createExecutor(IILcom/nostra13/universalimageloader/core/assist/QueueProcessingType;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->taskExecutorForCachedImages:Ljava/util/concurrent/Executor;

    .line 576
    :goto_21
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCache:Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

    if-nez v0, :cond_3d

    .line 577
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheFileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    if-nez v0, :cond_2f

    .line 578
    invoke-static {}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createFileNameGenerator()Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheFileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    .line 580
    :cond_2f
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheFileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    iget-wide v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheSize:J

    iget v4, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCacheFileCount:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createDiskCache(Landroid/content/Context;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;JI)Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->diskCache:Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

    .line 583
    :cond_3d
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    if-nez v0, :cond_49

    .line 584
    iget v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCacheSize:I

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createMemoryCache(I)Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    .line 586
    :cond_49
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->denyCacheImageMultipleSizesInMemory:Z

    if-eqz v0, :cond_5a

    .line 587
    new-instance v0, Lcom/nostra13/universalimageloader/cache/memory/impl/FuzzyKeyMemoryCache;

    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    invoke-static {}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;->createFuzzyKeyComparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/nostra13/universalimageloader/cache/memory/impl/FuzzyKeyMemoryCache;-><init>(Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->memoryCache:Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    .line 589
    :cond_5a
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    if-nez v0, :cond_66

    .line 590
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createImageDownloader(Landroid/content/Context;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    .line 592
    :cond_66
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->decoder:Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;

    if-nez v0, :cond_72

    .line 593
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->writeLogs:Z

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createImageDecoder(Z)Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->decoder:Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;

    .line 595
    :cond_72
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->defaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    if-nez v0, :cond_7c

    .line 596
    invoke-static {}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->createSimple()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->defaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .line 598
    :cond_7c
    return-void

    .line 568
    :cond_7d
    iput-boolean v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->customExecutor:Z

    goto :goto_11

    .line 574
    :cond_80
    iput-boolean v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->customExecutorForCachedImages:Z

    goto :goto_21
.end method


# virtual methods
.method public build()Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    .registers 3

    .prologue
    .line 559
    invoke-direct {p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;->initEmptyFieldsWithDefaultValues()V

    .line 560
    new-instance v0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;-><init>(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$Builder;Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$1;)V

    return-object v0
.end method
