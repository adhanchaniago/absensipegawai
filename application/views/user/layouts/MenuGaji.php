


<div class="bg-white shadow overflow-hidden sm:rounded-lg">
  <div class="px-4 py-2 border-b border-gray-200 sm:px-6">
    <h3 class="text-lg leading-6 font-medium text-gray-900">
      Slip Gaji
    </h3>
    <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
      PT Matahari
    </p>
  </div>
  <div>
    <dl>
      <div class="bg-gray-50 px-4 py-1 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm leading-5 font-medium text-gray-500">
          Gaji Pokok
        </dt>
        <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
          <?php echo $gaji_pokok?>
        </dd>
      </div>
      <div class="bg-white px-4 py-1 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm leading-5 font-medium text-gray-500">
          Terlambat
        </dt>
        <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
        <?php echo $terlambat?>
        </dd>
      </div>
      <div class="bg-gray-50 px-4 py-1 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm leading-5 font-medium text-gray-500">
          Lembur
        </dt>
        <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
        <?php echo $lembur?>
        </dd>
      </div>
      <div class="bg-white px-4 py-1 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm leading-5 font-medium text-gray-500">
          Total Gaji
        </dt>
        <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
        <?php echo $total_gaji?>
        </dd>
      </div>
      
    </dl>
  </div>
</div>


